#include <iostream>

#include <vector>
#include "algorithm"

#include <map>
#include <string>

#include "main.h"

using namespace std;

int findLetterInString(string &S,string target)
{
    int count = 0;
    size_t nPos = S.find(target, 0); // first occurrence
    while(nPos != string::npos)
    {
        count++;
        nPos = S.find(target, nPos + 1);
    }

    // cout << count;
    return count;
}

int solution(string &S)
{
    typedef struct {
        int occ;
        int target;
    }tmp;

    map<string,tmp> myMap = {
        pair<string,tmp>("B",{0,1}),
        pair<string,tmp>("A",{0,1}),
        pair<string,tmp>("L",{0,2}),
        pair<string,tmp>("O",{0,2}),
        pair<string,tmp>("N",{0,1})
        };
        
    vector<int> tmp2 ;
    for (auto& kv : myMap) {
        kv.second.occ = findLetterInString(S,kv.first);
        std::cout << kv.first << " has value " << kv.second.occ << std::endl;
        tmp2.push_back(kv.second.occ / kv.second.target);
        // cout<< "tmp" << tmp << endl;
    }

    return *min_element(std::begin(tmp2), std::end(tmp2));
}

int main (void)
{
    string input ;
    input = "BAONXXOLL";
    cout <<"BAONXXOLL : " << solution(input) << endl ;
    input = "BAOOLLNNOLOLGBAX";
    cout <<"BAOOLLNNOLOLGBAX : " << solution(input) << endl ;
    input = "QAWABAWONL";
    cout <<"QAWABAWONL : " << solution(input) << endl ;

}