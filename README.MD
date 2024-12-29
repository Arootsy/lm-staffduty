# LM-DEVELOPMENT - Staff Duty

[LM-DEVELOPMENT](https://discord.gg/RbSVrGBA9t) has released a free resource on GitHub called "Staff Duty" for FiveM servers that utilize TX-Admin. This resource provides an efficient way to manage and check the duty status of staff members.

## Key Features

- **Integration with TX-Admin**: The resource seamlessly works with TX-Admin, a popular management system for FiveM servers.

- **Simple Status Check**: Both client and server can easily verify the duty status of a player.

- **Statebag-Based System**: Utilizes FiveM's statebag system for efficient status updates.

## Requirements

For the best experience, we recommend using the following versions or newer:

- **[ox_lib](https://github.com/overextended/ox_lib)**: Version 3.27.0 or newer
- **[illenium-appearance](https://github.com/iLLeniumStudios/illenium-appearance)**: Version 5.4.0 or newer

## Use Cases

With this resource, server administrators can:

1. Track the duty status of staff members.
2. Assign specific functions or permissions to staff members who are on duty.
3. Improve logging and monitoring of staff activities.

## Code Examples

**Client-side Check:** (Not Recommended)

```lua
if LocalPlayer.state.isOnDuty then
    print("Hello World, I am on staff duty")
end
```

**Server-side Check:**
```lua
if Player(source).state.isOnDuty then
    print("Hello World, I am on staff duty")
end
```
