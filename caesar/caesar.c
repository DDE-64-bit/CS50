#include <stdio.h>
#include <cs50.h>
#include <stdbool.h>
#include <stdlib.h>
#include <ctype.h>


int main(int argc, char *argv[])
{
    int k;
    string text;
    bool is_literal_number(string text);
    void offset_string(char text[], int offset);

    if (! (argc == 2 && is_literal_number(argv[1])))
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    k = atoi(argv[1]);

    text = get_string("plaintext:  ");

    offset_string(text, k);

    printf("ciphertext: %s\n", text);

    return 0;
}


bool is_literal_number(string text)
{
    bool valid_number = false;

    for (int i = 0; text[i]; i++)
    {
        if (i == 0 && text[i] == '-')
            continue;

        if (text[i] >= '0' && text[i] <= '9')
            valid_number = true;
        else
            return false;
    }

    return valid_number;
}


void offset_string(char text[], int offset)
{
    int i = 0;

    while (text[i])
    {
        if (isupper(text[i]))
            text[i] = ((text[i] - 'A' + offset) % 26) + 'A';
        else if (islower(text[i]))
            text[i] = ((text[i] - 'a' + offset) % 26) + 'a';
        i++;
    }
}