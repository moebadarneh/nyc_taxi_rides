from dagster import Definitions, load_assets_from_modules

from .assets import metrics, requests, trips
from .jobs import adhoc_request_job, trip_update_job, weekly_update_job
from .resources import database_resource
from .schedules import trip_update_schedule, weekly_update_schedule

trip_assets = load_assets_from_modules([trips])
metric_assets = load_assets_from_modules(
    modules=[metrics],
    group_name="metrics",
)
requests_assets = load_assets_from_modules(
    modules=[requests],
    group_name="requests",
)

all_jobs = [trip_update_job, weekly_update_job, adhoc_request_job]
all_schedules = [trip_update_schedule, weekly_update_schedule]

defs = Definitions(
    assets=trip_assets + metric_assets + requests_assets,
    resources={
        "database": database_resource,
    },
    jobs=all_jobs,
    schedules=all_schedules,
)
