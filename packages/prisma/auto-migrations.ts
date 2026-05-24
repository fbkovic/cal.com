async function main(): Promise<void> {
  console.info("Skipping auto-migrations: migrations are managed manually");
  return;
}

main().catch((e) => {
  console.error(e.stdout || e.stderr || e.message);
  process.exit(1);
});
