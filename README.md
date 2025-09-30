A simple Flask application that generates random number is hosted on the web, built with docker for easy deployment with healthcheck and version control if health check fails. 
# Tech used
- Flask
- Python
- Docker/DockerHub
- Gunicorn
- Github Actions

(Git and Docker must be installed)

# How to run:
1) Clone this repository (git clone https://github.com/onyx-yk/rollback-devops.git)
2) VERSION file contains the version that is to be hosted (v1,v2 or v3) and the success_ver.txt holds the last successful version that was hosted for rollback with minimal downtime. Specify which version to host.
3) Run using Git Bash by simply executing "./deploy.sh".
4) This builds a Docker container for the specified version and hosts it in localhost:5000
5) v1 and v2 are the different versions of the webapp but v3 simulates broken version to trigger rollback to last successful hosted version.
6) When finished, run "./close.sh".
