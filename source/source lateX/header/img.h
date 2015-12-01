string drawImage(vector<string> toParse, bool &isError) {
	int manN = 1, conS;
	mss optionsOpt, optionsMan, manOpt, optOpt; pss opt;

	manOpt["source"]="name";
	optOpt["w"]="width";
	optOpt["h"]="height";

	fse(i, 0, manN-1) { opt = splitTwo(toParse[i], "="); optCompMan optionsMan[manOpt[opt.f]] = opt.s; else errorOpt(manOpt) eraseMap(manOpt,opt.f)}
	fse(i, manN, toParse.size()-1) { opt = splitTwo(toParse[i], "="); conS = i; optComp optionsOpt[optOpt[opt.f]] = opt.s; else break;}

	string render = "\\begin{figure}\n\\includegraphics[" ;
	fseMap(optionsOpt) render += it->first + "=" + it->second +"pt, " ; render += "]{";
	render += optionsMan["name"] + "}\n\\end{figure}";

	return render;

}
