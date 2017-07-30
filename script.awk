BEGIN {
	OFS="\t"
}
{
	if (NR==1) {
		print
	}
	else {
		split($1, a, "_")
		b = a[1]
		command = "basename $(ls "
		command = command DIR "/" b "_*)"
		command|getline $1
		close(command)
		print
	}
}
