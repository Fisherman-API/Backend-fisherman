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
('', ''),
('', ''),
('', '');
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






