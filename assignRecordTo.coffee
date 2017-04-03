getStdin = require 'get-stdin'
Airtable = require 'airtable'
base = new Airtable(apiKey: 'keya5owBYIn0zRzxP').base('app2PLtM6KVLhzhrJ')

getStdin()
.then (updateData) ->
  base('Bugs & Issues').update(
    updateData.record,
    { 'Assigned to': updateData.assignTo },
    (err, record) ->
      if err
        console.error err
        return
      console.log JSON.stringify(assignedTo: record.get 'Assigned to')
  )
