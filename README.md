# Install

To install the dotfiles

```sh
./install.sh
```

## Special Setup

### thunderbird

1. Go to Thunderbird Settings
1. Go to Add-ons and Themes
1. Enable the theme

# NVIDIA Users

## Integrated Mode (Low Power)

**Note:** In this mode, external monitors may not work on some laptops!  
This is because certain laptops have their HDMI ports directly wired to the NVIDIA graphics card.

In **Integrated Mode**, the NVIDIA GPU is completely powered off to maximize battery life.
This means all graphical processing is handled by the integrated GPU, reducing power consumption significantly.

## Hybrid Mode (Balanced)

When a laptop boots on battery power, **Hybrid Mode** is selected by default.

- In this mode, the NVIDIA GPU is powered on but only used when explicitly required.
- Unlike **Integrated Mode**, external monitors **can** be used.
- Some applications may automatically offload processing to the NVIDIA GPU if the appropriate flags are set.

To manually offload an application to the NVIDIA GPU in Hybrid Mode, use the following command:

```sh
prime-run <appname>
```

Or set the following flags:

```sh
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME="nvidia" __VK_LAYER_NV_optimus="NVIDIA_only" <appname>
```

## NVIDIA Mode (Performance)

When a laptop boots while connected to a power supply, **NVIDIA Mode** is selected by default.

- In this mode, the NVIDIA GPU acts as the primary graphics processor.
- This mode provides **the best performance** but also has the **highest battery consumption**.
- It is ideal when the laptop is plugged in and performance is the priority.

## Issues

If there are some issues have a look at the optimus-manager docs for [power management](https://github.com/Askannz/optimus-manager/wiki/A-guide--to-power-management-options).

In this configuration I use the **_Runtime D3 power management_** method for power management.

**Note:** this configuration is only available for laptops with Turing-generation GPU or above + Coffee Lake Intel CPU or above.
Otherwise try **_Configuration 3 : bbswitch_** method.
Use the `optimus-manager-qt` application where you can set the optimus switching method to **bbswitch** easily.
(Note that the **bbswitch** package has the be installed for this to work.)

# Credits

- I thank the [catppuccin community](https://catppuccin.com/) for their various configs that have been used in this project.
- Rofi: I stole most of the rofi layouts from [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots). Thank you!
