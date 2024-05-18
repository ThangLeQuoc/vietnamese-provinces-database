package common

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/joho/godotenv"
	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/pgdialect"
	"github.com/uptrace/bun/driver/pgdriver"
	"log"
	"os"
)

func GetPostgresDBConnection() *bun.DB {

	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	// s3Bucket := os.Getenv("S3_BUCKET")
	// secretKey := os.Getenv("SECRET_KEY")

	// TODO @thangle: Move this to environment variable?
	dsn := "postgres://thanglequoc:thanglequoc@localhost:15432/vn_provinces_tmp?sslmode=disable"
	sqlDB := sql.OpenDB(pgdriver.NewConnector(pgdriver.WithDSN(dsn)))
	db := bun.NewDB(sqlDB, pgdialect.New())
	return db
}

func BootstrapTemporaryDatasetStructure() {
	bytesVal, err := os.ReadFile("./resources/db_table_init.sql")
	if err != nil {
		panic(err)
	}
	query := string(bytesVal)
	db := GetPostgresDBConnection()
	ctx := context.Background()
	_, err = db.ExecContext(ctx, query)
	ctx.Done()
	if err != nil {
		panic(err)
	}

	fmt.Println("Temporary Provinces tables created")
}

func PersistExistingProvincesDataset() {

	// TODO @thangle: Improvement - Download the existing dataset patch on GitHub
	// https://raw.githubusercontent.com/ThangLeQuoc/vietnamese-provinces-database/master/postgresql/ImportData_vn_units.sql

	bytesVal, err := os.ReadFile("./resources/db_table_existing_dataset_patch.sql")
	if err != nil {
		panic(err)
	}
	query := string(bytesVal)
	db := GetPostgresDBConnection()
	ctx := context.Background()
	_, err = db.ExecContext(ctx, query)
	ctx.Done()
	if err != nil {
		panic(err)
	}

	fmt.Println("Existing dataset patch imported")
}
