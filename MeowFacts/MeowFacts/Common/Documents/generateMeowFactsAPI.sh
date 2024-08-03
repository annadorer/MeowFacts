MODULE="Modules/MeowFactsAPI/Sources/MeowFactsAPI/"

openapi-generator generate -i "MeowFacts.yaml" -g swift5 -o "MeowFacts"
rm -r $MODULE""*
cp -R "MeowFacts/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "MeowFacts"
