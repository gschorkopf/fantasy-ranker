desc "importing daily player stats"
task import_nerds: [:environment] do
  NerdImporter.import
end
