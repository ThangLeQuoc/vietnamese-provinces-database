package common

import (
	"context"
	"database/sql"
	"fmt"
	"os"

	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/pgdialect"
	"github.com/uptrace/bun/driver/pgdriver"
)

func GetPostgresDBConnection() *bun.DB {
	dsn := "postgres://postgres:root@localhost:5432/vn_provinces_tmp?sslmode=disable"
	sqlDB := sql.OpenDB(pgdriver.NewConnector(pgdriver.WithDSN(dsn)))
	db := bun.NewDB(sqlDB, pgdialect.New())
	return db
}

func BootstrapTemporaryDatasetStructure() {
	bytesVal, err := os.ReadFile("./resources/db_table_init.sql")
	if (err != nil) {
		panic(err)
	}
	query := string(bytesVal)
	db := GetPostgresDBConnection()
	ctx := context.Background()
	_, err = db.ExecContext(ctx, query)
	ctx.Done()
	if (err != nil) {
		panic(err)
	}


	fmt.Println("Temporary Provinces tables created")
}

func PersistExistingProvincesDataset() {
	bytesVal, err := os.ReadFile("./resources/db_table_existing_dataset_patch.sql")
	if (err != nil) {
		panic(err)
	}
	query := string(bytesVal)
	db := GetPostgresDBConnection()
	ctx := context.Background()
	_, err = db.ExecContext(ctx, query)
	ctx.Done()
	if (err != nil) {
		panic(err)
	}

	fmt.Println("Existing dataset patch imported")
}
