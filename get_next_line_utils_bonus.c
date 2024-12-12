/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_utils_bonus.c                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ekeinan <ekeinan@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/26 19:21:17 by ekeinan           #+#    #+#             */
/*   Updated: 2024/11/27 19:38:28 by ekeinan          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line_bonus.h"

size_t	ft_strlen(char *s)
{
	size_t	i;

	i = 0;
	while (s[i])
		i++;
	return (i);
}

size_t	ft_strlen_until_nl(char *s, ssize_t *nl_i)
{
	size_t	i;

	i = 0;
	while (s[i] && s[i] != '\n')
		i++;
	if (s[i] == '\n')
	{
		*nl_i = i;
		i++;
	}
	return (i);
}

void	*ft_bzero(void *s, size_t n)
{
	size_t	i;
	char	*arr;

	if (!n)
		return (s);
	arr = (char *) s;
	i = 0;
	while (i < n)
		arr[i++] = 0;
	return (s);
}

char	*ft_strdup_until_nl(char *src, ssize_t *nl_i)
{
	char	*dup;
	size_t	i;

	dup = malloc((ft_strlen_until_nl(src, nl_i) + 1) * sizeof(char));
	if (!dup)
		return (NULL);
	i = 0;
	while (src[i] && src[i] != '\n')
	{
		dup[i] = src[i];
		i++;
	}
	if (src[i] == '\n')
	{
		dup[i] = src[i];
		i++;
	}
	dup[i] = '\0';
	return (dup);
}
