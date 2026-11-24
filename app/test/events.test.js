const test = require('node:test');
const assert = require('node:assert');
const { events } = require('../events');

test('every event has a title and a positive seat count', () => {
  for (const event of events) {
    assert.ok(event.title.length > 0);
    assert.ok(event.seats > 0);
  }
});
