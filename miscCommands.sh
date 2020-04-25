# see all port activity
sudo netstat -tlnp

# shutdown process on that port
fuser -k 8000/tcp
