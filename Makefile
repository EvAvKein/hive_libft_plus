# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ekeinan <ekeinan@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/11 09:31:47 by ekeinan           #+#    #+#              #
#    Updated: 2025/02/11 13:56:33 by ekeinan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft_full.a

LIBBASE_DIR := libft
LIBBASE_FILE := libft.a
LIBBASE_PATH := $(LIBBASE_DIR)/$(LIBBASE_FILE)

DPRINTF_DIR := ft_dprintf
DPRINTF_SRC := ft_dprintf.c \
			   increase_print_count.c \
			   print_chars.c \
			   print_int.c \
			   print_ptr.c \
			   print_hex.c
DPRINTF_OBJ := $(DPRINTF_SRC:%.c=$(DPRINTF_DIR)/%.o)

GNL_DIR := get_next_line
GNL_SRC := get_next_line_bonus.c \
		   get_next_line_utils_bonus.c
GNL_OBJ := $(GNL_SRC:%.c=$(GNL_DIR)/%.o)

COMPILE_FLAGS := -Wall -Wextra -Werror -I$(LIBBASE_FILE)

all: $(NAME)

%.o: %.c
	cc $(COMPILE_FLAGS) -c $< -o $@
		
$(LIBBASE_PATH):
	@make bonus -C $(LIBBASE_DIR) --no-print-directory

$(NAME): $(DPRINTF_OBJ) $(GNL_OBJ) $(LIBBASE_PATH)
	@cp $(LIBBASE_PATH) $(NAME)
	ar -rcs $(NAME) $(DPRINTF_OBJ) $(GNL_OBJ)

clean:
	@make -C $(LIBBASE_DIR) $@ --no-print-directory
	rm -f $(DPRINTF_OBJ) $(GNL_OBJ)

fclean: clean
	@make -C $(LIBBASE_DIR) $@ --no-print-directory
	rm -f $(NAME)

re: fclean all
	@make -C $(LIBBASE_DIR) $@ --no-print-directory

neat: $(NAME) clean
	clear

.PHONY: all clean fclean re
