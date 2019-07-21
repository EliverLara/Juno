for i in assets/*;
	set -l file_name (basename $i .svg)
	if test -f ./$file_name'.png'
		echo $file_name exists
	else
		echo Creating $file_name'.png'
		convert -background none $i ./$file_name'.png'
	end
;end
