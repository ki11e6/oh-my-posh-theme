# Custom Oh My Posh Theme Configuration

This repository contains a custom Oh My Posh theme configuration tailored for terminal theming. The theme is designed with multiple blocks and segments to enhance shell prompt readability and functionality.

## Theme Overview

The theme is designed to enhance your terminal prompt with various segments:

### Prompt Configuration

The prompt is customized with different segments like OS information, shell type, session details, path, Git status, execution time, and more.

### Palette

Defines the default foreground and background colors used throughout the theme.

### Console Title Template

Formats the console title based on user, host, shell, and current working directory.

### Blocks

#### Prompt Block

- OS: Displays the operating system icon or name.
- Shell: Displays the current shell.
- Session: Shows session details, including SSH session and user/host name.
- Path: Displays the current directory path.
- Git: Shows Git repository information such as branch, status, and commits.
- Execution Time: Displays the execution time of the last command.

#### Right Aligned Prompt Block

- Terraform: Shows the Terraform workspace name.
- Languages: Displays information about various programming languages (Python, Go, Rust, Ruby, Elixir, Node, React, CMake, Angular, .NET, Flutter, Haskell, Julia, Kotlin, Lua, Perl, PHP, R, Swift).
- Project: Displays information about the current project.
- Exit: Shows an exit code and its meaning if non-zero.
- Execution Time: Displays the execution time of the last command.
- Time: Displays the current date and time.

#### Tooltips

Provides additional information for specific tools like kubectl, AWS, Azure, GCP, ArgoCD, and Docker.

## Changes Made

### New Segments Added

- **React Segment**: Displays information related to React, the JavaScript library.

  ```yarml
  - type: react
        style: diamond
        leading_diamond: ''
        trailing_diamond: ' '
        foreground: '#61dafb'
        background: 'background'
        properties:
          home_enabled: false
          fetch_version: true
          display_mode: files
        template: '
          {{ if .Full }}{{ .Full }}{{ end
          }}'

  ```

- **Update Segment**: Displays when there's an update available for Oh My Posh.

  ```yarml
  - type: upgrade
        style: diamond
        leading_diamond: ''
        trailing_diamond: ''
        foreground: '#ffbf00'
        background: 'background'
        template: '
          {{ if .Status }}{{ .Status }}{{ end
          }}'

  ```

### Modifications

- Adjusted colors, icons, and templates for existing segments to improve readability and visual consistency.
