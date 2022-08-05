#include <iostream>

#include <vector>
#include <string>

#include "main.h"

using namespace std;

int solution(string &S)
{
    int result = 0;
    int pos = 0;
    
    while(pos < S.length() -1 )
    {
        string substring = S.substr(pos, 2);
        result = (result<stoi(substring))?stoi(substring):result;
        pos+=1;
    }

    return result;
}

int main (void)
{
    string input ;
    input = "50552";
    cout <<"50552 : " << solution(input) << endl ;
    input = "10101";
    cout <<"10101 : " << solution(input) << endl ;
    input = "88";
    cout <<"88 : " << solution(input) << endl ;
    input = "8";
    cout <<"8 : " << solution(input) << endl ;

}