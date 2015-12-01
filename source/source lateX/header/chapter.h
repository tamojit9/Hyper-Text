string drawChapter(vector<string> toParse, bool &isError) {
	int manN = 1, conS;
	mss optionsOpt, optionsMan, manOpt, optOpt; pss opt;

	manOpt["name"]="name";

	fse(i, 0, manN-1) { opt = splitTwo(toParse[i], "="); optCompMan optionsMan[manOpt[opt.f]] = opt.s; else errorOpt(manOpt) eraseMap(manOpt,opt.f)}
	fse(i, manN, toParse.size()-1) { opt = splitTwo(toParse[i], "="); conS = i; optComp optionsOpt[optOpt[opt.f]] = opt.s; else break;}

	string render = "\\chapter{" + optionsMan["name"] + "}\n";
	fse(i, conS, toParse.size()-1) render +=  toParse[i] + "\\\\\n"; 

	return render;

}
