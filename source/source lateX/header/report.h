#include "extractOptions.h"

string report(vector<string> toParse, bool &isError) {
    int conS=0;
	mss options, manOpt, optOpt; pss opt;
	optOpt["name"]="author";
	optOpt["title"]="title";

	if(!toParse.empty())
        fse(i, 0, toParse.size()-1) { conS = i; opt = splitTwo(toParse[i], "="); optComp options[optOpt[opt.f]] = opt.s; else break;}
	string render = "\\documentclass{report}\n\\usepackage{graphicx}\n\\begin{document}\n\\title{" + options["title"] + "}\n\\author{" + options["author"] + "}\n\\maketitle\n" ;
	
	fse(i, conS, toParse.size()-1) render +=  toParse[i]; render += "\\end{document}";
	return render;

}
