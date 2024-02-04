alias mygit='cd $HOME/workspace/personal-repositories/myenv'

printLine(){
	echo "-------------------------------"
}

mygitSave(){
	printLine
	echo "-----Moving to my git----------"
	printLine
	mygit

	printLine
	echo "-------Add all files-----------"
	printLine
	git add .

	printLine
	echo "---------Commit all------------"
	printLine
	git commit -m "Save Progress"

	printLine
	echo "----------Push all-------------"
	printLine
	git push

	printLine
	echo "Moving back to the original dir"
	printLine
	cd -
}

