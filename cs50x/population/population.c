#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int startLamaAmount;

    do
    {
        startLamaAmount = get_int("Start Amount: ");
    }
    while (startLamaAmount < 9);

    int endLamaAmount;

    do
    {
        endLamaAmount = get_int("End Amount: ");
    }
    while (startLamaAmount > endLamaAmount);

    int amountOfYears = 0;

    if (startLamaAmount == endLamaAmount){
        printf("Years: 0\n");
    }

    do
    {
        startLamaAmount = startLamaAmount + (startLamaAmount / 3) - (startLamaAmount / 4);
        amountOfYears++;
    }
    while (startLamaAmount < endLamaAmount);

    printf("Amount Of Years: %i\n", amountOfYears);
}
