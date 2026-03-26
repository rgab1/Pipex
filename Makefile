# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: grivault <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/03/03 11:06:44 by grivault          #+#    #+#              #
#    Updated: 2026/03/03 18:05:00 by grivault         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= pipex
CC			= cc
C_FLAGS		= -Wall -Wextra -Werror
CPP_FLAGS	= -MMD

LIBFT_DIR	= Libft
LIBFT		= $(LIBFT_DIR)/libft.a

SRC			= pipex.c \
			  Utils/debug.c \
			  Utils/run_command.c \
			  Utils/run_pipeline.c \
			  Utils/parsing.c \
			  Utils/get_path.c \
			  Utils/free_stuff.c \
			  Utils/ft_split_quotes.c

OBJ			= $(SRC:.c=.o)

DEPENDENCIES = $(OBJ:.o=.d)

INCLUDES = -I . -I $(LIBFT_DIR) -I Utils

all: $(LIBFT) $(NAME)

-include : $(DEPENDENCIES)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) $(CPP_FLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJ) $(DEPENDENCIES)
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

redo: re
	make clean
	clear

.PHONY: all clean fclean re redo
