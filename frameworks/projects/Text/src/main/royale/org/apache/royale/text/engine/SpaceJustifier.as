////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.text.engine
{
	import org.apache.royale.text.engine.TextJustifier;
	import org.apache.royale.text.engine.SpaceJustifier;

	public class SpaceJustifier extends TextJustifier
	{
		public function SpaceJustifier(locale:String = "en", lineJustification:String = "unjustified", letterSpacing:Boolean = false)
		{
			this.letterSpacing = letterSpacing;
			super(locale, lineJustification);
		}

		override public function clone():TextJustifier
		{
			var retVal:SpaceJustifier = new SpaceJustifier(locale, lineJustification);
			retVal.letterSpacing = letterSpacing;
			retVal.maximumSpacing = maximumSpacing;
			retVal.minimumSpacing = minimumSpacing;
			retVal.optimumSpacing = optimumSpacing;
			return retVal;
		}
		public var letterSpacing : Boolean;
		public var maximumSpacing : Number;
		public var minimumSpacing : Number;
		public var optimumSpacing : Number;
	}
}