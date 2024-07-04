#!/bin/bash

OUT_DIR="../assets/generated/"


# Enter the book source directory
cd book
for chapter in $(ls); do
    if [ "$chapter" != "assets" ]
    then
        printf "Processing $chapter...\n"
        
        # Create the output directory
        mkdir $OUT_DIR$chapter
        
        # Enter the Corresponding Chapter
        cd $chapter
        
        # Compile the main.tex file
        xelatex  main.tex

        # Copy the output to the output directory
        cp -p main.pdf "../$OUT_DIR$chapter/"

        # Remove the output and corresponding generated files
        rm *.aux *.toc *.log *.pdf
        
        # Exit the current chapter
        cd ..
    fi
done

# # Also render the updated PDF

# # Fix permissions
# cd ..
# chmod 0777 _includes/*
# echo "Files generated:"
# ls _includes/paper