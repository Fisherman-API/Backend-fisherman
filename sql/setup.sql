-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS fish CASCADE;
DROP TABLE IF EXISTS profile CASCADE;
DROP TABLE IF EXISTS regulations CASCADE;
DROP TABLE IF EXISTS fish_regulations CASCADE;

CREATE TABLE profile (
        id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        count VARCHAR NOT NULL,
        type VARCHAR NOT NULL,
        location VARCHAR NOT NULL
);


CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username TEXT NOT NULL,
    email VARCHAR UNIQUE,
    password_hash VARCHAR NOT NULL
);



CREATE TABLE fish (
    id BIGINT,
    name VARCHAR NOT NULL PRIMARY KEY,
    detail TEXT NOT NULL
   
    
);

INSERT INTO fish (name, detail) VALUES 
('Red-Fish', 'Acadian redfish are orange to flame red, with paler underbellies.
They have a flattened body that is longer than it is deep.
They have large eyes and a large mouth lined with many small teeth.
They have one continuous dorsal fin that runs from the nape of their neck to their caudal peduncle (where the body meets the tail) and a small tail fin.
Young redfish are marked with patches of black and green pigment. They don’t develop their red pigment until after they move to the ocean bottom.');







CREATE TABLE regulations (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL ,
    detail VARCHAR NOT NULL
);

INSERT INTO regulations (name, detail) VALUES 
('Red-Fish', 'Permitting requirements for commercial vessels.
Separate management measures for recreational vessels.
Time/Area Closures to protect spawning fish and habitat.
Minimum fish sizes to prevent harvest of juvenile fish.
Annual catch limits, based on best available science.
An optional sector (catch share) program can be used for cod and other groundfish species. 
The sector program allows fishermen to form harvesting cooperatives and work together to decide when, where, and how they harvest fish.'),
('Pollock', 'The Alaska pollock fishery is a great example of how science-based management(link is external) and monitoring can help ensure the long-term sustainability of the resource.
The Bering Sea fishery is one of the first U.S. fisheries to be managed with catch shares and is often considered one of the best-managed fisheries in the world.'),
('Flounder', 'Limits on the number of permits and fishermen allowed.
Limits on the minimum size of fish that may be harvested.
Limit on how much may be harvested in one fishing trip.
Certain seasons and areas are closed to fishing.
Gear restrictions help reduce bycatch and impacts on habitat.'),
('Atlantic Bigeye Tuna', 'Commercial fishermen must have a permit to harvest bigeye tuna.
Gear restrictions.
Time/area closures.
Minimum size limit.'),
('Atlantic Blacktip Shark', 'Permits are required, and only a limited number of permits are available.
Commercial quotas and limits on how many sharks can be landed per fishing trip.
Gear restrictions and requirements.
Fishing season is generally year-round, but individual commercial shark fisheries close when the quota is reached.'),
('Atlantic Chub Mackerel', 'Managed using annual catch limits allocated between the commercial and recreational fisheries.
Managers monitor commercial catch on a weekly basis and will close the fisheries if the limits are reached before the fishing season is over.
Fishermen must have a Mackerel, Squid, and Butterfish permit to harvest Atlantic chub mackerel.'),
('Atlantic Cod', 'Permitting requirements for commercial vessels.
Separate management measures for recreational vessels.
Year-round and seasonal area closures to protect spawning fish and habitat.
Minimum fish sizes to prevent harvest of juvenile fish.
Annual catch limits, based on best available science.'),
('Atlantic Common Thresher Shark', 'Permits are required, and only a limited number of permits are available.
Commercial quotas and limits on how many sharks can be landed per fishing trip.
Gear restrictions and requirements.
Fishing season is generally year-round, but individual commercial shark fisheries close when the quota is reached.'),
('Atlantic Halibut', 'Permitting requirements for commercial vessels.
Separate management measures for recreational vessels.
Year-round and seasonal area closures to protect spawning fish and habitat.
Minimum fish sizes to prevent harvest of juvenile fish.
Annual catch limits, based on best available science.'),
('Atlantic Herring', 'An annual catch limit for the entire herring fishery based upon scientific information on the status of the stock.
Managers divide the catch limit into four area-specific limits. When an area-specific limit is reached, the directed fishery in that area is prohibited and only incidental catches of herring are allowed.
A limited access permit program limits the number of vessels that can participate in the directed fishery for herring. Vessels that do not qualify for a limited access permit can be issued an open access permit, allowing them to harvest a small amount of herring (6,600 pounds) per day or per trip.
Limits on the amount of herring a vessel can possess in one day or on one trip, depending on the type of permit.'),
('Atlantic Mackerel', 'Mackerel are managed in federal waters. There are no state management measures for mackerel.
Managed using annual catch limits allocated between the commercial and recreational fisheries.
Managers monitor commercial catch on a weekly basis and will close the fisheries if the limits are reached before the fishing season is over.'),
('Atlantic Mahi Mahi', 'Permits are required to sell mahi mahi.
Minimum size limit for mahi mahi caught off the coasts of Georgia, Florida, and South Carolina to protect smaller fish.'),
('Atlantic Pollock', 'Permitting requirements for commercial vessels.
Separate management measures for recreational vessels.
Time/Area Closures to protect spawning fish and habitat.
Minimum fish sizes to prevent harvest of juvenile fish.
Annual catch limits, based on best available science.'),
('Atlantic Salmon', 'Prohibits possession of wild Atlantic salmon and any directed or incidental Atlantic salmon catch in federal waters.
All Atlantic salmon caught incidentally in other fisheries must be released in a manner that ensures maximum probability of survival. This protects Atlantic salmon in U.S. marine waters and complements management in state-managed riverine and coastal waters.'),
('Atlantic Sharpnose Shark', 'Permits are required, and only a limited number of permits are available.
Commercial quotas and limits on how many sharks can be landed per fishing trip.
Gear restrictions and requirements.
Fishing season is generally year-round, but the sharpnose shark fishery, managed as part of the non-blacknose small coastal shark management group, may close when the landings are projected to reach 80 percent of the quota.'),
('Atlantic Shortfin Mako Shark', 'Permits are required, and only a limited number of permits are available.
Commercial quotas and limits on how many sharks can be landed per fishing trip.
Gear restrictions and requirements.
Fishing season is generally year-round, but individual commercial shark fisheries close when the quota is reached.
Shark dealers are required to attend Atlantic shark identification workshops to help them better identify shark species.
Prohibited species—there are more than 20 species of sharks that cannot be landed (e.g., white, dusky, basking, longfin mako, night). Some of these species look similar to the species that can be landed.'),
('Atlantic Wahoo', 'Commercial vessel, charter vessel/headboat, and dealer permits are required.
Annual catch limits divided between the commercial and recreational fisheries, with the recreational fishery receiving a significant majority of the allocation.
Commercial fishing trip, recreational bag, possession, and minimum size limits.
Accountability measures are in place to ensure the overfishing limit is not exceeded, or to account for any overages.
Management measures apply in the South Atlantic Council jurisdiction, but no management measures in the Gulf of Mexico.
Compatible regulations in state waters, particularly Florida.'),
('Atlantic Yellowfin Tuna', 'Commercial fishermen must have a permit to harvest yellowfin tuna.
Gear restrictions.
Time/area closures.
Minimum size limit.
Federal management for Atlantic tunas applies to state waters as well, except in Maine, Connecticut, and Mississippi. NOAA Fisheries periodically reviews these states’ regulations to make sure they’re consistent with federal regulations.'),
('Black Grouper', 'Commercial fishermen must have a permit to fish, land, or sell black grouper. Managers limit the number of available permits to control the number of fishermen harvesting black grouper.
Annual catch limits are used for black grouper in the commercial and recreational fisheries. These fisheries are closed when their annual catch limit is projected to be met.
Both the commercial and recreational fisheries have size limits to reduce harvest of immature black grouper.'),
('Black Sea Bass', 'Annual catch limit divided between the commercial and recreational fisheries.
The commercial catch limit is further divided among the states based on historical harvests.
Specific management measures for the commercial fishery include:
Minimum size limits.
Minimum mesh requirements for trawls.
A moratorium on entry into the fishery.
Closed seasons.'),
('Bluefish', 'Commercial fishermen must have a permit to catch and sell bluefish.
Managers set an annual catch limit.
The majority of catch is allocated to the recreational fisheries.
The commercial catch limit is divided into state-specific allocations. Unused recreational catch can be re-allocated to commercial fisheries.'),
('Blueline Tilefish', 'Permit requirements for commercial and for-hire vessels.
Annual catch limits for the commercial and recreational fisheries.
Limits on commercial possession. The fishery is closed if the landing limit is harvested.
Closed season and bag limit for recreational anglers.'),
('Bocaccio', 'Permits and limited entry to the fishery.
Limit on how much may be harvested in one fishing trip.
Certain seasons and areas are closed to fishing.
Gear restrictions help reduce bycatch and impacts on habitat.'),
('Butterfish', 'Fishermen must have a permit to harvest butterfish. Managers limit the amount of available permits to control harvests.
Annual catch limits are in place to prevent overfishing.
Managers monitor commercial catch weekly.
Vessel trip limits are based on gear mesh sizes, and are adjusted based on landings.'),
('Canary Rockfish', 'Permits and limited entry to the fishery.
Limit on how much may be harvested in one fishing trip.
Certain seasons and areas are closed to fishing.
Gear restrictions help reduce bycatch and impacts on habitat.'),
('Chinook Salmon', 'Every year, the council reviews reports of the previous fishing season and current estimates of salmon abundance. Using this information, they make recommendations for management of the upcoming fishing season.
Their general goal is to allow fishermen to harvest the maximum amount of salmon that will support the fishery while preventing overharvest of the resource and ensuring that salmon populations with low abundance can rebuild.
Specific management measures vary year to year depending on current salmon abundance, and include size limits, season length, quotas, and gear restrictions.'),
('Chum Salmon', 'All Pacific salmon species fall under the jurisdiction of this plan, although it currently only provides fishery management objectives for Chinook, coho, pink, and any salmon species listed under the Endangered Species Act.
There are no directed fisheries for chum salmon in federal waters in this area, and chum salmon are rarely caught in the fisheries managed by the council.
Chum salmon are caught primarily in inland waters (such as Puget Sound and Hood Canal) where fisheries are managed to ensure that conservation objectives are met.'),
('Cobia', 'Fishermen do not need a federal permit to harvest cobia.
Gear restrictions:
Drift gillnets are prohibited.
Authorized gear includes automatic reel, bandit gear, handline, rod-and-reel, and pelagic longline.
Cobia must be a minimum size to be harvested, and must be landed with their heads and fins intact. Current minimum size limit is 33 inches fork length.  Amendment 7 will be increasing the minimum size limit to 36 inches fork length.
Commercial and recreational fishermen have size limits, trip limits, and per person per day or per vessel per day bag limits.
Annual catch limits based on best available science.'),
('Coho Salmon', 'Every year, the council reviews reports of the previous fishing season and current estimates of salmon abundance. Using this information, they make recommendations for management of the upcoming fishing season.
Their general goal is to allow fishermen to harvest the maximum amount of salmon that will support the fishery while preventing overharvest of the resource and ensuring that salmon populations with low abundance can rebuild.
Specific management measures vary year to year depending on current salmon abundance, and include size limits, season length, quotas, and gear restrictions.'),
('Crimson Jobfish', 'Crimson jobfish are managed as part of multispecies stock complexes under these five ecosystem plans. There are annual catch limits in place for these five stock complexes. 
Commercial fishermen are required to have permits to fish in federal waters and report their catch.
Recreational fishermen fishing in federal waters for Hawaii bottomfish are required to have permits and record their catch. There are no permit or reporting requirements for recreational fishermen fishing in federal waters for Guam, American Samoa, and Northern Mariana Islands bottomfish, but there are prohibited gear types and harvest techniques. Non-commercial fishing is prohibited within 12 nm of emergent land within the Pacific Remote Islands Marine National Monument.  ');

-- ('pollock', 'North Pacific Ocean', '1 Adult per day', 'All Year'),
-- ('Flounder', 'Northern Cali through the bering Sea', '1 Adult per day, 20 per Year', 'oct-dec'),
-- ('Atlantic Bigeye Tuna', 'Atlantic, Pacific, Indian Oceans', 'catch limit may vary', 'All Year'),
-- ('Atlantic BlackTip Shark', 'Gulf of Mexico', 'shark dealer permit required, limit 4 per year', 'All Year');

-- CREATE TABLE fish_regulations (
--     id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     fish_name VARCHAR NOT NULL,
--     regulations_name VARCHAR NOT NULL,
--     name VARCHAR NOT NULL,
--     FOREIGN KEY (fish_name) REFERENCES regulations(name),
--     region VARCHAR NOT NULL,
--     FOREIGN KEY (regulations_name) REFERENCES regulations(name),
--     rules VARCHAR NOT NULL,
--     seasons VARCHAR NOT NULL
-- );






