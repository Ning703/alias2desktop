-- 为选中的文件/文件夹创建快捷方式并移动到桌面 Create alias to selected files/folders and move them to the desktop
tell application "Finder"
	try
		-- 获取当前选中的项目（文件/文件夹） Get the currently selected items (file/folder)
		set selectedItems to selection
		
		-- 检查是否有选中的项目 Check for selected items
		if selectedItems is {} then
			display dialog "请先在访达中选中需要创建快捷方式的文件或文件夹！" & return & "Please select the file or folder you need to create a alias to in Finder!" buttons {"OK"} default button 1 with icon caution
			error number -128 -- 终止脚本执行 Terminate script execution
		end if
		
		-- 获取桌面路径 Get Desktop Path
		set desktopPath to path to desktop folder as text
		
		-- 遍历所有选中的项目 Iterate over all selected items
		repeat with anItem in selectedItems
			-- 获取项目名称（用于别名命名）Get items' name (for alias naming)
			set itemName to name of anItem
			
			-- 构建别名保存路径（桌面 + 原名称 + " 别名"） Build alias save path (desktop + original name + " alias")
			set aliasPath to itemName & " alias"
			
			-- 检查桌面是否已存在同名别名，避免覆盖 Check if an alias of the same name already exists on the desktop to avoid overwriting it
			if exists file aliasPath then
				set counter to 1
				repeat
					set newAliasPath to itemName & " alias (" & counter & ")"
					if not (exists file newAliasPath) then
						set aliasPath to newAliasPath
						exit repeat
					end if
					set counter to counter + 1
				end repeat
			end if
			
			-- 创建别名并移动到桌面 Rename alias and move to desktop
			set newAlias to make new alias to anItem at desktopPath with properties {name:aliasPath}
			
			-- 选中新建的别名（方便快速定位） Select the newly created alias (for quick location)
			select newAlias
		end repeat
		
	on error errMsg number errNum
		-- 异常处理 Exception handling
		display dialog "操作失败：" & errMsg & "（错误代码：" & errNum & "）" & return & "Operation Error：" & errMsg & "（Error code：" & errNum & "）" buttons {"OK"} default button 1 with icon stop
	end try
end tell
