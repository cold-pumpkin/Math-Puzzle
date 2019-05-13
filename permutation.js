function printPermutations(array, k){
    var combinations = [];
    var indices = [];
    
    
    function run(level, start){
        for(var i=0; i < array.length; i++){
            if(!indices[i]){
                indices[i] = true;
                combinations[level] = array[i];
                if(level < k - 1){
                    run(level + 1, i + 1);
                } else {
                    console.log(combinations.join(" "));
                }
                
                indices[i] = false;
            }
        }
    }
    run(0, 0);
}

printPermutations([1, 2, 3, 4], 3);

