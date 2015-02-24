declare -A array
# array=([county]=GEOID10)
array=([congress]=DISTRICT [senate]=DISTRICT [house]=DISTRICT [county]=GEOID10 [rc]=acronym)

for i in "${!array[@]}"
do
	echo "key  : $i"
	echo "value: ${array[$i]}"
	count=$(jq -r ".objects[].geometries | length" "data/topo/$i.json")
	echo "count: $count"
	for((j=0;j<$count;j++)); do
		id="${array[$i]}"
		name="${array[$i]}"
		if [ "$i" == "county" ]; then
			name="name"
		fi
		idVal="$(jq -r ".objects[].geometries[$j].properties.$id" "data/topo/$i.json")"
		nameVal="$(jq -r ".objects[].geometries[$j].properties.$name" "data/topo/$i.json")"
		echo "$i: $nameVal"
		wkhtmltopdf --javascript-delay 1000  "127.0.0.1:3000/#$i/$idVal/funding/pdf" "pdf/$i/$nameVal.pdf"; 

	done
done



