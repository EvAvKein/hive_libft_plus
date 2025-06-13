# LIBFT_PLUS

My complete utility library for C projects at 42 Network's Hive Helsinki 🐝

> [!TIP]
> If you're at a 42 school: It's genuinely so much better to ask fellow students instead of reading online solutions ✨

---

## Description

This project is my customized combination of my [libft](https://github.com/EvAvKein/libft), [ft_printf](https://github.com/EvAvKein/ft_printf), and [get_next_line](https://github.com/EvAvKein/get_next_line), with the following upgrades:
- `ft_printf` is now `ft_dprintf`:
	-  Replicates `dprintf` instead of `printf`, receiving an extra parameter for the print destination (instead of always using STDIN)
- `get_next_line` is now `set_next_line`:
	- Provides the new line via a pointer parameter, and returns a boolean for whether the `read()` was successful
	- Assigns default `FILE_CAPACITY` to `FOPEN_MAX` if available

We're allowed to use the combined (and optionally upgraded) libft in any project marked as "Libft authorized"!

---

## Usage

> [!NOTE]
> Code was written and tested for Linux (using Hive's Ubuntu iMacs)

- `#include "[path to libft_plus.h]"` in your program's header file or relevant C files
- Compile the library by running `make` (or even `make neat`!)
- Compile your own program with the `libft_plus.a` file created in the previous step

---

## Credits

- [Eve Keinan](https://github.com/EvAvKein)
