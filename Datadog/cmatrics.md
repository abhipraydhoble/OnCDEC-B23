## Set your Datadog API key

- Datadog > Integrations > APIs > API Keys

## create script 
````
nano send_metric.sh
````
## add below script and make sure to paste api key
````
#!/bin/bash

DD_API_KEY="<YOUR_API_KEY>"
VALUE=$((RANDOM % 100 + 1))
TIMESTAMP=$(date +%s)

curl -X POST "https://api.datadoghq.com/api/v1/series" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-d "{
  \"series\" : [{
      \"metric\":\"custom.shell.random.value\",
      \"points\":[[${TIMESTAMP}, ${VALUE}]],
      \"type\":\"gauge\",
      \"host\":\"$(hostname)\",
      \"tags\":[\"env:dev\",\"source:shell\"]
  }]
}"
````

## give permissions
````
chmod +x send_metric.sh
````
## run script
````
./send_metric.sh
````

## we can also automate this using crontab
````
crontab -e
````
````
*/5 * * * * /home/ec2-user/send_metric.sh
````

## Create a Custom Dashboard in Datadog
- Go to Datadog Dashboards
- Navigate to Dashboards > New Dashboard
- give name

## Add a Timeseries Widget
- Click + Add Widget
- Choose Timeseries

