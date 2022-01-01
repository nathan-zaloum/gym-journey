json.extract! journal, :id, :date, :weight, :entry, :gym_attendance, :gym_duration, :gym_type, :water, :calories, :created_at, :updated_at
json.url journal_url(journal, format: :json)
