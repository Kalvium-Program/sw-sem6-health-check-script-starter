const http = require('node:http');
const { events } = require('./events');

const port = Number(process.env.PORT || 3000);
const broken = process.env.EVENTS_MODE === 'broken';

function send(res, status, body) {
  res.writeHead(status, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify(body));
}

http.createServer((req, res) => {
  if (req.method === 'GET' && req.url === '/health') {
    send(res, 200, { status: 'ok' });
  } else if (req.method === 'GET' && req.url === '/api/events') {
    if (broken) {
      console.error('GET /api/events status=500 reason=events list unavailable');
      send(res, 500, { error: 'Events unavailable' });
      return;
    }
    console.log('GET /api/events status=200');
    send(res, 200, events);
  } else {
    send(res, 404, { error: 'Not found' });
  }
}).listen(port, '0.0.0.0', () => {
  console.log(`Campus Events app listening on ${port} (events mode: ${broken ? 'broken' : 'ok'})`);
});
