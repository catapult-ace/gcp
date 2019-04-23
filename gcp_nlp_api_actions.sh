#!/bin/bash
# Author @Andrew Egan
# ABOUT
	# This is a script created for the google natural-language api.  
	# It enables one to specify a natural language analysis action on a specific file.
	# This is hugely time saving. Rather than having to type out the very long curl command for each, you simply input the variables.
# Google Docs: https://cloud.google.com/natural-language/docs/how-to
# ACTIONS
	# analyzeEntities
	# analyzeSentiment
	# analyzeEntitySentiment
	# analyzeSyntax
# FILE
	# enter file name
# HELP
	# # Google Docs: https://cloud.google.com/natural-language/docs/how-to
	# Invoke like you would running a shell script in your own terminal with ./
	# If you edit this file outside of vim on gcp you will have to reupload it.
	# First <rm gcp_nl_api.sh>
	# Upload
	# Run <chmod a+x gcp_nl_api.sh> to change perms for the script to be able to run.
#To Do
	# Add larger library of API calls (classifyText)

read -p "Enter your Filename including file extension (e.g. my_file.json): "  FILE
echo "
	analyzeEntities;
	analyzeSentiment;
	analyzeEntitySentiment;
	analyzeSyntax
	"
read -p "Enter a natural-language action from the above list: "  ACTION

export API_KEY=yourprojectapikeygoeshere 	# Project = enteryourproject for reference

curl "https://language.googleapis.com/v1/documents:${ACTION}?key=${API_KEY}" \
  -s -X POST -H "Content-Type: application/json" --data-binary @${FILE}