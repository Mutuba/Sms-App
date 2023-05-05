# README

An app that schedules a mock sms that later sent out at a time specified by user

You can create a mock sms with the following sample payload:

`{
    "sent_at": "2023-05-05 17:18",
    "message": "Hi, Daniel"
}
`

`sent_at` indicates the time the mock will be scheduled to be sent.

List of tools used:

`Ruby version 3.0.4
Rails version 7.0.4
Database: PostgreSQL
Backgroud Job Processor: Sidekiq
Backgroud Job message broker: Redis
To avoid Backgroud Job duplications: SidekiqUniqueJobs`
