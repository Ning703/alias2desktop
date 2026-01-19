# alias2desktop
在macOS上将文件/文件夹的快捷方式发送到桌面。
Create and send the alias of a file or folder to desktop on MacOS. 
## Demo
https://github.com/user-attachments/assets/3a1b3e21-83df-4c2b-bf26-d4b5e0a36b05
- As shown in the demo, The final effect is similar to right-click on the project, then select "Send to" - "Desktop Shortcut" on WindowsOS. 
- This project is a savior to who miss the convenient shortcut process on WindowsOS, and want to realize it on MacOS.
## Requirement
- macOS 10.4 + (Tiger or later) 
## How to deploy
### Option1: Use the workflow directly
1. Download the project ZIP
2. 
### Option2: Build the Quick Action on Automator yourself
1. Enter Automator on your Mac, create a new Quick Action
2. Modify the top options as shown in the figure below<img width="659" height="106" alt="image" src="https://github.com/user-attachments/assets/829eca78-7fd0-49a2-8bd4-651434192bab" />
3. Drag the option "Run AppleScript" to the right
4. Download the project ZIP 
5. Unzip `Send to Desktop(create alias).applescript` file and open it with codeviewer
6. Copy the content and paste it into the Script Box(Replace the origin content)
7. Save the Quick Action, close the Automator
8. Right click an item in Finder, you can run the workflow inside the option "Quick Actions"!
### Tips
- You can find the saved workflow file in /Users/xxx/Library/Services/ . Click `Command+Shift+.` in Finder to see the hidden items.
- You can hide the Quick Action in `Setting-General-Login items & Extentions-Extentions-Finder`
## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
