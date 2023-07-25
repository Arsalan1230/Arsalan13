name: PyLint

on: [push, pull_request]
 
jobs:
  PEP8:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Setup Python
        uses: actions/setup-python@v1
        with:
          python-version: 3.11.3
          
      - name: Install Python lint libraries
        run: |
          pip install autoflake isort black
      - name: Remove unused imports and variables
        run: |
          autoflake --in-place --recursive --remove-all-unused-imports --remove-unused-variables --ignore-init-module-imports .
      - name: lint with isort
        run: |
          isort .
      - name: lint with black
        run: |
          black .
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: 'Auto-ғɪx'
          commit_options: '--no-verify'
          repository: .
          commit_user_name: Arsalan1230
          commit_user_email: arsalanjawed0033@gmail.com
          commit_author: Arsalan1230 <arsalanjawed0033@gmail.com>
