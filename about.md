# About Me

I am Ujwol, a passionate software engineer with familiarity in AI, Python, Flask, AWS, Cybersecurity, Google Cloud, and web development.

I thrive on solving complex problems and creating innovative solutions, blending technical excellence with a creative mindset.

## Project: Inactive Chrome Tabs Monitor

Developed a system to monitor inactive Chrome tabs for over 24 hours, notify the user with actionable options, and automate it to run on Windows startup. This includes a Chrome extension, Python notifier script, and task scheduling setup.

### System Architecture

```mermaid
graph TD;
    A[Chrome Extension] -->|Detect Inactive Tabs| B[Python Notifier Script];
    B -->|Send Notification| C[User];
    C -->|Action| D[Chrome Extension];
    B -->|Automate on Startup| E[Task Scheduler];