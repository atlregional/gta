declare -A array
array=([congress]=DISTRICT [senate]=DISTRICT [house]=DISTRICT [county]=GEOID10 [rc]=acronym)

for i in "${!array[@]}"
do
	echo "key  : $i"
	echo "value: ${array[$i]}"
	for key in $(jq -r ".objects[].geometries[] | .properties.${array[$i]}" "data/topo/$i.json"); do 
		echo $i
		echo $key
		wkhtmltopdf --javascript-delay 1000  "127.0.0.1:3000/#$i/$key/funding/pdf" "pdf/$i/$key.pdf"; 
	done
done



