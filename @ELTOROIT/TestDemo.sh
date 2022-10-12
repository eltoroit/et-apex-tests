echo "=== Swithing to $1"
git checkout $1
date
sfdx force:source:push --json --forceoverwrite
date
sfdx force:apex:test:run --synchronous --resultformat=junit --wait=30
date