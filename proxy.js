var websockify = require('node-websockify');

websockify({
  source: '0.0.0.0:9002',
  target: 'mqtt:1882'
});