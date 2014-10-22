json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :project_id, :prio, :deadline, :done
  json.url task_url(task, format: :json)
end
