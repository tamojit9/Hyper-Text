#include <iostream>
#include <string>
#include <sstream>
#include <map>
#include <vector>
#include <climits>
using namespace std;

#define fse(i, start,end) for(int i = (start); i <= (end); i++)
#define fn(i, end) for(int i = 0; i < (end); i++)
#define f first
#define s second
#define mss map<string, string>
#define pss pair<string, string>
#define optCompMan if((opt.first).compare(opt.second) && manOpt.count(opt.first))
#define optComp if((opt.first).compare(opt.second) && optOpt.count(opt.first))
#define errorOpt(mapX) { string errorX = "Mandatory option " + mapX.begin()->first + " missing"; isError = true; return errorX; }
#define eraseMap(mapX,key) { mapX.erase(mapX.find(key)); }
#define fseMap(mapX) for (mss::iterator it=mapX.begin(); it!=mapX.end(); ++it)

string ltrim(string line) {
	int i = 0;
	while(line[i] == ' ') i++;
	return line.substr(i);
}
string rtrim(string line) {
	int i = line.size()-1;
	while(line[i] == ' ') i--;
	return line.substr(0, i+1);
}
pair<string, string> splitTwo(string line, string delim) {
	int i = line.find(delim);
	return make_pair(rtrim(line.substr(0,i)), ltrim(line.substr(i+delim.size())));
}
int toInt(string s) {
	stringstream ss(s);
    int i;
    ss >> i;
    return i;
}
double toDouble(string s) {
	stringstream ss(s);
    double i;
    ss >> i;
    return i;
}
bool isInt(string s) {
	stringstream ss(s);
    int i;
    ss >> i;
    return ss.fail();
}
bool isDouble(string s) {
	stringstream ss(s);
    double i;
    ss >> i;
    return ss.fail();
}
