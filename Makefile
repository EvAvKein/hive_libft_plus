# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ekeinan <ekeinan@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/11 09:31:47 by ekeinan           #+#    #+#              #
#    Updated: 2025/01/02 13:10:41 by ekeinan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft_full.a
LIB_DIR = libft
LIB_FILE = libft.a
LIB_PATH = $(LIB_DIR)/$(LIB_FILE)

SRC = ft_printf.c \
	  increase_print_count.c \
	  print_chars.c \
	  print_int.c \
	  print_ptr.c \
	  print_hex.c \
	  get_next_line_bonus.c \
      get_next_line_utils_bonus.c

OBJ = $(SRC:.c=.o)

COMPILE_FLAGS = -Wall -Wextra -Werror

all: $(NAME)

%.o: %.c
	cc $(COMPILE_FLAGS) -c $< -o $@

$(LIB_PATH):
	@make bonus -C $(LIB_DIR) --no-print-directory
	@cp $(LIB_PATH) ./

$(NAME): $(OBJ) $(LIB_PATH)
	@cp $(LIB_PATH) $(NAME)
	ar -rcs $(NAME) $(OBJ)
	@rm $(LIB_FILE)

clean:
	@make -C $(LIB_DIR) $@ --no-print-directory
	rm -f $(OBJ)

fclean: clean
	@make -C $(LIB_DIR) $@ --no-print-directory
	rm -f $(NAME)

re: fclean all
	@make -C $(LIB_DIR) $@ --no-print-directory

.PHONY: all clean fclean re
