echo Create a scratch org
sfdx force:org:create --setdefaultusername --definitionfile=config/project-scratch-def.json --setalias=soEBikes --durationdays=1

echo "Open the deployment status"
sfdx force:org:open --path=/lightning/setup/DeployStatus/home

echo "Push the app to your scratch org"
sfdx force:source:push

echo "Assign the *ebikes* permission set"
sfdx force:user:permset:assign --permsetname=ebikes

echo "Assign the *Walkthroughs* permission set"
sfdx force:user:permset:assign --permsetname=Walkthroughs

echo "Import sample data"
sfdx force:data:tree:import --plan=./data/sample-data-plan.json

echo "Publish the Experience Cloud site"
sfdx force:community:publish --name=E-Bikes

echo "Deploy metadata for the Experience Cloud guest user profile"
sfdx force:mdapi:deploy --deploydir=guest-profile-metadata --wait=10
