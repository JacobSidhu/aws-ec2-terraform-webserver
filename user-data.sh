#!/bin/bash

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>AWS EC2 Terraform Web Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #0f172a;
            color: #f8fafc;
            text-align: center;
            padding-top: 80px;
        }
        .card {
            background: #1e293b;
            padding: 40px;
            border-radius: 16px;
            display: inline-block;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        }
        h1 {
            color: #38bdf8;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Hello from AWS EC2</h1>
        <p>This web server was deployed using Terraform Infrastructure as Code.</p>
        <p>Running on Ubuntu with Nginx.</p>
    </div>
</body>
</html>
EOF