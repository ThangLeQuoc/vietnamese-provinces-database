# Improvement plan

- Revise the script execution
- Introduce unit testing?
-

## Compare existing dataset and new dataset
- Compare strategy
- Pagination on the existing dataset, get a batch of n items.
- Query on the new dataset & compare the data.
- If the record does not found in the dataset -> unit has been remove (merge to another unit)
- There's a very rare chance that a new unit is introduced? How to prevent this?

## Integration Test?
https://www.ardanlabs.com/blog/2019/03/integration-testing-in-go-executing-tests-with-docker.html

