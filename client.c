/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jareste- <jareste-@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/14 16:19:59 by jareste-          #+#    #+#             */
/*   Updated: 2023/06/14 16:24:13 by jareste-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>
#include <stdlib.h>
#include <sys/types.h>
#include <stdio.h>

int	ft_atoi(const char *str)
{
	int				i;
	long long int	nbr;

	nbr = 0;
	i = 0;
	while (str[i] >= '0' && str[i] <= '9')
	{
		nbr = nbr * 10 + str[i] - '0';
		i++;
		if (nbr > 2147483647)
			return (-1);
	}
	return (nbr);
}

void	ft_send(const int pid, char ch, int bit)
{
	while (bit < 8)
	{
		if ((ch & (0x01 << bit)) != 0)
		{
			if (kill(pid, SIGUSR1) == -1)
			{
				write(1, "Server not reached\n", 19);
				exit(EXIT_FAILURE);
			}
			usleep(100);
		}
		else
		{
			if (kill(pid, SIGUSR2) == -1)
			{
				write(1, "Server not reached\n", 19);
				exit(EXIT_FAILURE);
			}
			usleep(100);
		}
		usleep(200);
		bit++;
	}
}

int	main(int argc, char **argv)
{
	int	pid;
	int	i;

	i = 0;
	if (argc == 3)
	{
		pid = ft_atoi(argv[1]);
		while (argv[2][i] != '\0')
		{
			ft_send(pid, argv[2][i], 0);
			i++;
		}
		ft_send(pid, '\n', 0);
	}
	else
	{
		write(1, "Error: wrong arguments.\n", 24);
		write(1, "Try: ./client <Server PID> <\"MESSAGE\">\n", 39);
		return (1);
	}
	return (0);
}
