# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jareste- <jareste-@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/17 04:01:10 by jareste-          #+#    #+#              #
#    Updated: 2023/06/17 04:35:34 by jareste-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_SERVER = server
NAME_CLIENT = client
NAME_SERVER_BONUS = server_bonus
NAME_CLIENT_BONUS = client_bonus

SRCS_CLIENT = client.c
SRCS_SERVER = server.c
SRCS_CLIENTBONUS = client_bonus.c
SRCS_SERVERBONUS = server_bonus.c
OBJS_CLIENT = ${SRCS_CLIENT:.c=.o}
OBJS_SERVER = ${SRCS_SERVER:.c=.o}
OBJS_CLIENTBONUS = ${SRCS_CLIENTBONUS:.c=.o}
OBJS_SERVERBONUS = ${SRCS_SERVERBONUS:.c=.o}
CC = gcc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror

all:	${OBJS_SERVER} ${OBJS_CLIENT}
		${CC} ${CFLAGS} ${SRCS_SERVER} -o ${NAME_SERVER}
		${CC} ${CFLAGS} ${SRCS_CLIENT} -o ${NAME_CLIENT}

bonus:	${OBJS_SERVERBONUS} ${OBJS_CLIENTBONUS}
		${CC} ${CFLAGS} ${SRCS_SERVERBONUS} -o ${NAME_SERVER_BONUS}
		${CC} ${CFLAGS} ${SRCS_CLIENTBONUS} -o ${NAME_CLIENT_BONUS}

client: ${OBJS_CLIENT}
		${CC} ${CFLAGS} ${SRCS_CLIENT} -o ${NAME_CLIENT}

server: ${OBJS_SERVER}
		${CC} ${CFLAGS} ${SRCS_SERVER} -o ${NAME_SERVER}

clean:
			${RM} ${OBJS_CLIENT} ${OBJS_SERVER} ${OBJS_CLIENTBONUS} ${OBJS_SERVERBONUS}

fclean: clean
			${RM} ${NAME_CLIENT} ${NAME_SERVER} ${NAME_CLIENT_BONUS} ${NAME_SERVER_BONUS}

re: fclean all

.PHONY: all client server clean fclean re bonus
