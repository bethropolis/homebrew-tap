#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"

root = Pathname.new(__dir__).parent
readme_path = root.join("README.md")
formula_dir = root.join("Formula")
cask_dir = root.join("Casks")

start_marker = "<!-- FORMULA_SECTION_START -->"
end_marker = "<!-- FORMULA_SECTION_END -->"
cask_start_marker = "<!-- CASK_TABLE_START -->"
cask_end_marker = "<!-- CASK_TABLE_END -->"

readme = readme_path.read

unless readme.include?(start_marker) && readme.include?(end_marker)
  warn "Markers not found in README.md. Add #{start_marker} and #{end_marker}."
  exit 1
end

unless readme.include?(cask_start_marker) && readme.include?(cask_end_marker)
  warn "Markers not found in README.md. Add #{cask_start_marker} and #{cask_end_marker}."
  exit 1
end

ignored_formulae = ["hello"]

formula_rows = Dir[formula_dir.join("*.rb")].sort.map do |path|
  name = File.basename(path, ".rb")
  next if ignored_formulae.include?(name)

  content = File.read(path)
  desc =
    content[/^\s*desc\s+"([^"]+)"/, 1] ||
    content[/^\s*desc\s+'([^']+)'/, 1] ||
    "No description"

  [name, desc]
end.compact

formula_section = ""
unless formula_rows.empty?
  formula_table_lines = []
  formula_table_lines << "| Formula | Description | Install |"
  formula_table_lines << "| ------- | ----------- | ------- |"
  formula_rows.each do |name, desc|
    formula_table_lines << "| `#{name}` | #{desc} | `brew install bethropolis/tap/#{name}` |"
  end
  formula_section = ["## Available formulae", "", formula_table_lines.join("\n")].join("\n")
end

cask_rows = Dir[cask_dir.join("*.rb")].sort.map do |path|
  name = File.basename(path, ".rb")
  content = File.read(path)
  desc =
    content[/^\s*desc\s+"([^"]+)"/, 1] ||
    content[/^\s*desc\s+'([^']+)'/, 1] ||
    "No description"

  [name, desc]
end

cask_table_lines = []
cask_table_lines << "| Cask | Description | Install |"
cask_table_lines << "| ---- | ----------- | ------- |"

if cask_rows.empty?
  cask_table_lines << "| _None_ | _No casks available_ | _N/A_ |"
else
  cask_rows.each do |name, desc|
    cask_table_lines << "| `#{name}` | #{desc} | `brew install --cask bethropolis/tap/#{name}` |"
  end
end

formula_replacement =
  if formula_section.empty?
    [start_marker, end_marker].join("\n")
  else
    [start_marker, formula_section, end_marker].join("\n")
  end
cask_replacement = [cask_start_marker, cask_table_lines.join("\n"), cask_end_marker].join("\n")

formula_pattern = /#{Regexp.escape(start_marker)}.*?#{Regexp.escape(end_marker)}/m
cask_pattern = /#{Regexp.escape(cask_start_marker)}.*?#{Regexp.escape(cask_end_marker)}/m

updated = readme.sub(formula_pattern, formula_replacement)
updated = updated.sub(cask_pattern, cask_replacement)

readme_path.write(updated)
