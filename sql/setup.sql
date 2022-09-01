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
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    detail TEXT NOT NULL
);

CREATE TABLE regulations (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL ,
    detail VARCHAR
);

CREATE TABLE fish_regulations (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fish_id BIGINT,
    regulations_id BIGINT,
    FOREIGN KEY (fish_id) REFERENCES fish(id),
    FOREIGN KEY (regulations_id) REFERENCES regulations(id)
);


INSERT INTO users (username, email, password_hash) VALUES
('admin', 'admin', '$2b$10$ff/m11WpVlU87bgzRG9pwOkG5LRzhwneD5mYsKoLERctL.oCVa8xy');

INSERT INTO fish (name, detail) VALUES ('Red-Fish', 'Acadian redfish are orange to flame red, with paler underbellies.
They have a flattened body that is longer than it is deep.
They have large eyes and a large mouth lined with many small teeth.
They have one continuous dorsal fin that runs from the nape of their neck to their caudal peduncle (where the body meets the tail) and a small tail fin.
Young redfish are marked with patches of black and green pigment. They don’t develop their red pigment until after they move to the ocean bottom.'),
('Pollock', 'Pollock is a member of the cod family.
They can grow as long as 3 feet but typically reach lengths between 12 and 20 inches and weigh between 1 and 3 pounds.
They have speckled coloring that helps them blend in with the seafloor to avoid predators.'),
('Flounder', 'Physical Description
Arrowtooth flounder are a relatively large, brownish colored flatfish with a large mouth.
They’re members of the family Pleuronectidae, the right-eyed flounders, which have both eyes on the right side and lie on the ocean floor on their left side.'),
('Atlantic Bigeye Tuna', 'Bigeye tuna are dark metallic blue on the back and upper sides and white on the lower sides and belly.
The first fin on their back is deep yellow, the second dorsal and anal fins are pale yellow, and the finlets are bright yellow with black edges.
Bigeye and yellowfin tuna look fairly similar. In fact, it’s hard to distinguish the two species without experience.
Among other characteristics, the bigeye’s eyes are larger than the yellowfin’s and their finlets have black edges.'),
('Atlantic Blacktip Shark', 'Atlantic blacktip sharks are gray to gray-brown, with white on the belly and a conspicuous wedge-shaped band or Z-shaped line on the sides.
Their pectoral, dorsal, and tail fins have black tips, but the anal fin is white. 
Their bodies have a torpedo shape, which allows them to swim through the water with little effort.
Atlantic blacktip sharks are often confused with spinner sharks due to their similar size, shape, coloration, and behavior. Both species are known for leaping and spinning out of the water while feeding on schools of fish. A distinguishing feature is that the anal fin on the blacktip shark is white whereas the anal fin of the spinner shark has a black tip.'),
('Atlantic Chub Mackerel', 'Atlantic chub mackerel are elongated and streamlined with deeply forked tails. 
They have small spines on the dorsal fin. 
They are silvery in color, with greenish-blue backs. The upper surfaces have dark zigzagging stripes, and the bellies are pale and marked with wavy lines.'),
('Atlantic Cod', 'Atlantic cod are heavy-bodied with a large head, blunt snout, and a distinct barbel (a whisker-like organ, like on a catfish) under the lower jaw.
Their coloring varies, ranging from light yellowish-green to red and olive, usually with darker speckles on the head, fins, tail, and body. The belly is light colored and usually spotless. Individuals can change color readily.
Cod have an obvious lateral line (the faint line that runs lengthwise down each side of the fish).'),
('Atlantic Common Thresher Shark', 'Thresher sharks are brown, gray, blue-gray, or blackish on the back and underside of their snout.
They are lighter on the sides, and fully white below.
Their pectoral, pelvic, and dorsal fins are blackish, and there are sometimes white dots on the tips of the pectoral, pelvic, and tail fins.
Their tail fin is sickle-shaped, and the upper part is extremely long, about half the length of their body.'),
('Atlantic Halibut', 'Atlantic halibut can be distinguished from other right-eyed flounders by their large size, concave caudal fin, large, gaping mouth, and arched lateral line.
One of the largest fish found in the Gulf of Maine.'),
('Atlantic Herring', 'Atlantic herring are small schooling fish.
They are silvery in color, with a bluish or greenish-blue back.'),
('Atlantic mackerel', 'Atlantic mackerel are iridescent blue green on the back with a silvery white underbelly.
They have 20 to 30 wavy black bars that run across the top half of their body, and a narrow dark streak that runs below these bars along each side.
Their body is spindle-shaped, tapering at both ends.
Their two large dorsal fins are gray or dusky. The pectoral fins are black or dusky at the base, and the tail fin is gray or dusky.
Their distinctive coloring fades quickly after they die.'),
('Atlantic Mahi Mahi', 'Brightly colored back is an electric greenish blue, lower body is gold or sparkling silver, and sides have a mixture of dark and light spots.
Bright pattern fades almost immediately after mahi mahi is harvested.
Adult males have a square head.
Females have a rounded head.
Distinguished from the pompano dolphin by its 55 to 66 dorsal fin rays and a very wide, square tooth patch on the tongue.'),
('Atlantic salmon', 'Atlantic salmon have a spindle-like body shape – rounded, broad in the middle, and tapered at each end. The shape is somewhat flattened toward the sides, which is typical of salmon species.
The head is relatively small, about one-fifth of the body length. The underside paired fins are prominent, especially on juveniles.
Spawning adults darken to a bronze color after entering freshwater and darken further after they spawn. When spawning has been completed, they are often referred to as kelts or black salmon.  Their silver color returns after they re-enter the sea.'),
('Atlantic sharpnose sharks', 'Atlantic sharpnose sharks are small for sharks and have a streamlined body.
They get their name from their long, pointy snout.
They are several different shades of gray and have a white underside.
Adults have white spots on their sides and white along the edges of their pectoral fins.
Young sharks have black on their dorsal (back) and caudal (tail) fin edges.
The lower and upper jaws of an Atlantic sharpnose shark have 24 or 25 rows of triangular teeth.'),
('Atlantic Shortfin Mako Shark', 'Shortfin mako sharks have very pointed snouts and long gill slits. 
They have dark blue/gray backs, light metallic blue sides, and white undersides.
Shortfin mako sharks can be differentiated from longfin mako sharks. Compared to shortfin mako sharks, longfin mako sharks have much longer pectoral fins and larger eyes, a different body shape, and the underside of their snout is darker.'),

('Atlantic Skipjack tuna', 'Skipjack tuna do not have scales except on the corselet (a band of large, thick scales behind the head) and the faint lateral line running lengthwise down each side of the fish.
Their back is dark purplish blue, and their lower sides and belly are silvery with four to six conspicuous longitudinal dark bands, which may look like continuous lines of dark blotches.'),
('Atlantic Striped bass', 'Striped bass have stout bodies with seven to eight continuous horizontal stripes on each side, from their gills to their tail.
They are light green, olive, steel blue, black, or brown on top, with a white or silver iridescent underside.'),
('Atlantic Wahoo', 'Atlantic wahoo are steel blue above and pale blue below.
They are covered with small scales and have a series of 25 to 30 irregular blackish-blue vertical bars on their sides that fade rapidly after death.
They have large mouths with strong, triangular, compressed, and finely serrated teeth.
Their snouts are about as long as the rest of their heads.'),
('', ''),
('', ''),
('', '');


INSERT INTO regulations (name, detail) VALUES ('Red-Fish', 'Permitting requirements for commercial vessels.
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


INSERT INTO fish_regulations (fish_id, regulations_id) VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9', '9'),
('10','10');

